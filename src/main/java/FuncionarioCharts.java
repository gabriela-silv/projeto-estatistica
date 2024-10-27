import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.ui.ApplicationFrame;

import javax.swing.*;
import java.awt.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class FuncionarioCharts extends ApplicationFrame {
    private ChartPanel currentChartPanel;

    public FuncionarioCharts(String title) {
        super(title);

        // Inicializa o gráfico de média
        currentChartPanel = new ChartPanel(createMediaAnualChart());
        currentChartPanel.setPreferredSize(new Dimension(800, 600));

        // Configuração do painel principal
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
        mainPanel.add(currentChartPanel);

        // Botões para alternar entre os gráficos
        JPanel buttonPanel = new JPanel();
        buttonPanel.add(createButton("Mostrar Média", this::showMediaChart));
        buttonPanel.add(createButton("Mostrar Moda", this::showModaChart));
        buttonPanel.add(createButton("Mostrar Mediana", this::showMedianaChart));
        buttonPanel.add(createButton("Mostrar Desvio Padrão", this::showDesvioPadraoChart));
        buttonPanel.add(createButton("Mostrar Coeficiente de Variação", this::showCoeficienteVariacaoChart));
        buttonPanel.add(createButton("Maior Contratação", this::showMaiorContratacaoChart));
        buttonPanel.add(createButton("Base Salarial Mais Alta", this::showBaseSalarialMaisAltaChart));
        buttonPanel.add(createButton("Maior Número de Funcionários", this::showMaiorNumeroFuncionariosChart));
        buttonPanel.add(createButton("Maior Número de Demissões", this::showMaiorNumeroDemissoesChart));

        mainPanel.add(buttonPanel);
        setContentPane(mainPanel);
    }

    private JButton createButton(String label, Runnable action) {
        JButton button = new JButton(label);
        button.addActionListener(e -> action.run());
        return button;
    }

    private void showMediaChart() {
        currentChartPanel.setChart(createMediaAnualChart());
    }

    private void showModaChart() {
        currentChartPanel.setChart(createModaChart());
    }

    private void showMedianaChart() {
        currentChartPanel.setChart(createMedianaChart());
    }

    private void showDesvioPadraoChart() {
        currentChartPanel.setChart(createDesvioPadraoChart());
    }

    private void showCoeficienteVariacaoChart() {
        currentChartPanel.setChart(createCoeficienteVariacaoChart());
    }

    private void showMaiorContratacaoChart() {
        currentChartPanel.setChart(createMaiorContratacaoChart());
    }

    private void showBaseSalarialMaisAltaChart() {
        currentChartPanel.setChart(createBaseSalarialMaisAltaChart());
    }

    private void showMaiorNumeroFuncionariosChart() {
        currentChartPanel.setChart(createMaiorNumeroFuncionariosChart());
    }

    private void showMaiorNumeroDemissoesChart() {
        currentChartPanel.setChart(createMaiorNumeroDemissoesChart());
    }

    // Conexão com o banco de dados
    private Connection getConnection() throws SQLException {
        String url = "jdbc:mysql://localhost:3306/estatistica";
        String user = "root"; // substitua pelo seu usuário
        String password = "1234"; // substitua pela sua senha
        return DriverManager.getConnection(url, user, password);
    }

    // Método para obter dados de média anual
    private Map<Integer, Double> getMediaAnualData() {
        Map<Integer, Double> mediaAnual = new HashMap<>();
        String query = "SELECT EXTRACT(YEAR FROM data_contratacao) AS ano, AVG(salario) AS media_salarial " +
                "FROM funcionario " +
                "GROUP BY ano " +
                "ORDER BY ano;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                mediaAnual.put(rs.getInt("ano"), rs.getDouble("media_salarial"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mediaAnual;
    }

    // Gráfico de Média Anual
    private JFreeChart createMediaAnualChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        Map<Integer, Double> mediaAnualData = getMediaAnualData();
        for (Map.Entry<Integer, Double> entry : mediaAnualData.entrySet()) {
            dataset.addValue(entry.getValue(), "Média Salarial", entry.getKey().toString());
        }

        return ChartFactory.createBarChart(
                "Média Salarial Anual", "Ano", "Média Salarial",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de moda
    private Map<Double, Integer> getModaData() {
        Map<Double, Integer> moda = new HashMap<>();
        String query = "SELECT salario, COUNT(*) AS frequencia " +
                "FROM funcionario " +
                "GROUP BY salario " +
                "ORDER BY frequencia DESC " +
                "LIMIT 1;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                moda.put(rs.getDouble("salario"), rs.getInt("frequencia"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return moda;
    }

    // Gráfico de Moda
    private JFreeChart createModaChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        Map<Double, Integer> modaData = getModaData();
        for (Map.Entry<Double, Integer> entry : modaData.entrySet()) {
            dataset.addValue(entry.getValue(), "Frequência", entry.getKey().toString());
        }

        return ChartFactory.createBarChart(
                "Moda Salarial", "Salário", "Frequência",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de mediana
    private double getMedianaData() {
        double mediana = 0.0;
        String query = "SELECT AVG(salario) AS mediana " +
                "FROM ( " +
                "    SELECT salario, ROW_NUMBER() OVER (ORDER BY salario) AS row_num, " +
                "           COUNT(*) OVER () AS total_count " +
                "    FROM funcionario " +
                ") AS subquery " +
                "WHERE row_num IN (FLOOR((total_count + 1) / 2), CEIL((total_count + 1) / 2));";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                mediana = rs.getDouble("mediana");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mediana;
    }

    // Gráfico de Mediana
    private JFreeChart createMedianaChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        double medianaData = getMedianaData();
        dataset.addValue(medianaData, "Valor", "Mediana");

        return ChartFactory.createBarChart(
                "Mediana Salarial", "Métrica", "Valor",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de desvio padrão
    private double getDesvioPadraoData() {
        double desvioPadrao = 0.0;
        String query = "SELECT STDDEV(salario) AS desvio_padrao FROM funcionario;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                desvioPadrao = rs.getDouble("desvio_padrao");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return desvioPadrao;
    }

    // Gráfico de Desvio Padrão
    private JFreeChart createDesvioPadraoChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        double desvioPadraoData = getDesvioPadraoData();
        dataset.addValue(desvioPadraoData, "Valor", "Desvio Padrão");

        return ChartFactory.createBarChart(
                "Desvio Padrão Salarial", "Métrica", "Valor",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de coeficiente de variação
    private double getCoeficienteVariacaoData() {
        double coeficienteVariacao = 0.0;
        String query = "SELECT (STDDEV(salario) / AVG(salario)) * 100 AS coeficiente_variacao FROM funcionario;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                coeficienteVariacao = rs.getDouble("coeficiente_variacao");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return coeficienteVariacao;
    }

    // Gráfico de Coeficiente de Variação
    private JFreeChart createCoeficienteVariacaoChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        double coeficienteVariacaoData = getCoeficienteVariacaoData();
        dataset.addValue(coeficienteVariacaoData, "Valor", "Coeficiente de Variação");

        return ChartFactory.createBarChart(
                "Coeficiente de Variação Salarial", "Métrica", "Valor",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de maior contratação
    private Map<Integer, Integer> getMaiorContratacaoData() {
        Map<Integer, Integer> maiorContratacao = new HashMap<>();
        String query = "SELECT EXTRACT(YEAR FROM data_evento) AS ano, COUNT(*) AS total_contratacoes " +
                "FROM historico_contratacao " +
                "WHERE evento = 'contratacao' " +
                "GROUP BY ano " +
                "ORDER BY total_contratacoes " +
                "LIMIT 1;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                maiorContratacao.put(rs.getInt("ano"), rs.getInt("total_contratacoes"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maiorContratacao;
    }

    // Gráfico de Maior Contratação
    private JFreeChart createMaiorContratacaoChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        Map<Integer, Integer> maiorContratacaoData = getMaiorContratacaoData();
        for (Map.Entry<Integer, Integer> entry : maiorContratacaoData.entrySet()) {
            dataset.addValue(entry.getValue(), "Contratações", entry.getKey().toString());
        }

        return ChartFactory.createBarChart(
                "Maior Número de Contratações", "Ano", "Total de Contratações",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de base salarial mais alta
    private Map<Integer, Double> getBaseSalarialMaisAltaData() {
        Map<Integer, Double> baseSalarialMaisAlta = new HashMap<>();
        String query = "SELECT EXTRACT(YEAR FROM data_contratacao) AS ano, AVG(salario) AS media_salarial " +
                "FROM funcionario " +
                "GROUP BY ano " +
                "ORDER BY media_salarial DESC " +
                "LIMIT 1;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                baseSalarialMaisAlta.put(rs.getInt("ano"), rs.getDouble("media_salarial"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return baseSalarialMaisAlta;
    }

    // Gráfico de Base Salarial Mais Alta
    private JFreeChart createBaseSalarialMaisAltaChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        Map<Integer, Double> baseSalarialMaisAltaData = getBaseSalarialMaisAltaData();
        for (Map.Entry<Integer, Double> entry : baseSalarialMaisAltaData.entrySet()) {
            dataset.addValue(entry.getValue(), "Média Salarial", entry.getKey().toString());
        }

        return ChartFactory.createBarChart(
                "Ano com Base Salarial Mais Alta", "Ano", "Média Salarial",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de maior número de funcionários
    private Map<Integer, Integer> getMaiorNumeroFuncionariosData() {
        Map<Integer, Integer> maiorNumeroFuncionarios = new HashMap<>();
        String query = "SELECT EXTRACT(YEAR FROM data_contratacao) AS ano, COUNT(*) AS total_funcionarios " +
                "FROM funcionario " +
                "GROUP BY ano " +
                "ORDER BY total_funcionarios DESC " +
                "LIMIT 1;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                maiorNumeroFuncionarios.put(rs.getInt("ano"), rs.getInt("total_funcionarios"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maiorNumeroFuncionarios;
    }

    // Gráfico de Maior Número de Funcionários
    private JFreeChart createMaiorNumeroFuncionariosChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        Map<Integer, Integer> maiorNumeroFuncionariosData = getMaiorNumeroFuncionariosData();
        for (Map.Entry<Integer, Integer> entry : maiorNumeroFuncionariosData.entrySet()) {
            dataset.addValue(entry.getValue(), "Total de Funcionários", entry.getKey().toString());
        }

        return ChartFactory.createBarChart(
                "Ano com Maior Número de Funcionários", "Ano", "Total de Funcionários",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    // Método para obter dados de maior número de demissões
    private Map<Integer, Integer> getMaiorNumeroDemissoesData() {
        Map<Integer, Integer> maiorNumeroDemissoes = new HashMap<>();
        String query = "SELECT EXTRACT(YEAR FROM data_evento) AS ano, COUNT(*) AS total_demissoes " +
                "FROM historico_contratacao " +
                "WHERE evento = 'demissao' " +
                "GROUP BY ano " +
                "ORDER BY total_demissoes DESC " +
                "LIMIT 1;";
        try (Connection conn = getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            if (rs.next()) {
                maiorNumeroDemissoes.put(rs.getInt("ano"), rs.getInt("total_demissoes"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return maiorNumeroDemissoes;
    }

    // Gráfico de Maior Número de Demissões
    private JFreeChart createMaiorNumeroDemissoesChart() {
        var dataset = new org.jfree.data.category.DefaultCategoryDataset();
        Map<Integer, Integer> maiorNumeroDemissoesData = getMaiorNumeroDemissoesData();
        for (Map.Entry<Integer, Integer> entry : maiorNumeroDemissoesData.entrySet()) {
            dataset.addValue(entry.getValue(), "Total de Demissões", entry.getKey().toString());
        }

        return ChartFactory.createBarChart(
                "Ano com Maior Número de Demissões", "Ano", "Total de Demissões",
                dataset, PlotOrientation.VERTICAL, true, true, false);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            FuncionarioCharts chart = new FuncionarioCharts("Gráficos de Funcionários");
            chart.pack();
            chart.setVisible(true);
        });
    }
}
