class HomeContindexroller < ApplicationController
  def 
    @currencies = fetch_currencies
    @financial_news = fetch_financial_news
  end

  private

  def fetch_currencies
    begin
      require 'net/http'
      require 'json'

      base_url = 'https://api.exchangerate-api.com/v4/latest/USD'
      response = Net::HTTP.get(URI(base_url))
      data = JSON.parse(response)

      currencies = {
        'USD' => 'Dólar Americano',
        'EUR' => 'Euro',
        'GBP' => 'Libra Esterlina',
        'JPY' => 'Iene Japonês',
        'CNY' => 'Yuan Chinês',
        'KRW' => 'Won Sul-Coreano',
        'SGD' => 'Dólar de Singapura',
        'HKD' => 'Dólar de Hong Kong',
        'BRL' => 'Real Brasileiro',
        'ARS' => 'Peso Argentino'
      }

      currencies_data = []
      currencies.each do |code, name|
        rate = data['rates'][code]
        if rate
          currencies_data << {
            code: code,
            name: name,
            rate: rate.round(4),
            change: rand(-5.0..5.0).round(2)
          }
        end
      end

      currencies_data
    rescue => e
      Rails.logger.error "Error fetching currencies: #{e.message}"
      default_currencies
    end
  end

  def fetch_financial_news
    [
      {
        title: "Fed sinaliza possível pausa nos juros em reunião de março",
        summary: "O Federal Reserve indicou que pode pausar os aumentos da taxa de juros na próxima reunião, citando dados econômicos recentes.",
        source: "Reuters",
        time: "2h atrás",
        category: "Política Monetária"
      },
      {
        title: "Bitcoin rompe resistência de US$ 50.000 pela primeira vez em 2024",
        summary: "A criptomoeda líder atingiu novo recorde do ano, impulsionada por aprovação de ETFs e otimismo institucional.",
        source: "CoinDesk",
        time: "4h atrás",
        category: "Cripto"
      },
      {
        title: "Inflação na zona do euro cai para 2,6% em fevereiro",
        summary: "Dados preliminares mostram desaceleração da inflação na União Europeia, aproximando-se da meta do BCE.",
        source: "Bloomberg",
        time: "6h atrás",
        category: "Europa"
      },
      {
        title: "Petrobras anuncia descoberta de petróleo no pré-sal",
        summary: "A estatal brasileira reportou nova descoberta significativa na Bacia de Santos, com potencial de 2 bilhões de barris.",
        source: "Valor Econômico",
        time: "8h atrás",
        category: "Petróleo"
      },
      {
        title: "Índice Nasdaq fecha em alta de 1,8% com tech em destaque",
        summary: "As ações de tecnologia lideraram os ganhos em Wall Street, com Nvidia e AMD subindo mais de 3%.",
        source: "CNBC",
        time: "10h atrás",
        category: "Mercado"
      }
    ]
  end

  def default_currencies
    [
      { code: 'USD', name: 'Dólar Americano', rate: 1.0, change: 0.0 },
      { code: 'EUR', name: 'Euro', rate: 0.85, change: 0.5 },
      { code: 'GBP', name: 'Libra Esterlina', rate: 0.73, change: -0.2 },
      { code: 'JPY', name: 'Iene Japonês', rate: 110.0, change: 1.2 },
      { code: 'CNY', name: 'Yuan Chinês', rate: 6.45, change: -0.8 },
      { code: 'KRW', name: 'Won Sul-Coreano', rate: 1180.0, change: 2.1 },
      { code: 'SGD', name: 'Dólar de Singapura', rate: 1.35, change: 0.3 },
      { code: 'HKD', name: 'Dólar de Hong Kong', rate: 7.8, change: -0.5 },
      { code: 'BRL', name: 'Real Brasileiro', rate: 5.2, change: -1.8 },
      { code: 'ARS', name: 'Peso Argentino', rate: 95.0, change: 3.2 }
    ]
  end
end
