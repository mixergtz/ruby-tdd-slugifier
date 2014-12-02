class Slugifier

    def self.convert(text)

      tilde_vowels = {
        "á" => "a",
        "é" => "e",
        "í" => "i",
        "ó" => "o",
        "ú" => "u",
        "Á" => "a",
        "É" => "e",
        "Í" => "i",
        "Ó" => "o",
        "Ú" => "u",
        "ñ" => "n",
        "Ñ" => "N"
      }

      text = text.gsub(/[^\w ]/) { |char|  tilde_vowels[char] || char }

      text = text.gsub(/[^a-z0-9]+|\s+/i, " ").strip().downcase().gsub(/\s+/, "-")

      text

    end

end