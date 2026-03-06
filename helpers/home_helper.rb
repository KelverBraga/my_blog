module HomeHelper
  def currency_flag(currency_code)
    flags = {
      'USD' => '🇺🇸',
      'EUR' => '🇪🇺',
      'GBP' => '🇬🇧',
      'JPY' => '🇯🇵',
      'CNY' => '🇨🇳',
      'KRW' => '🇰🇷',
      'SGD' => '🇸🇬',
      'HKD' => '🇭🇰',
      'BRL' => '🇧🇷',
      'ARS' => '🇦🇷'
    }
    flags[currency_code] || '🌍'
  end
end
