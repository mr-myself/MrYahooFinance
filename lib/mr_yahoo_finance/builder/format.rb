module MrYahooFinance
  module Builder
    module Format
      module Indicator

        class << self
          def periods(element, count)
            [].tap do |data|
              (2..(count+1)).each do |number|
                data << build_text(element, number).to_i
              end
            end
          end

        private
          def build_text(element, number)
            if negative?(element, number)
              '-'.concat(extract(element, number).to_i.to_s)
            else
              extract(element, number)
            end
          end

          def negative?(element, number)
            element.css("td[#{number}]").text.include?('(')
          end

          def extract(element, number)
            element.css("td[#{number}]").text.delete(',').delete('(').delete(')')
          end
        end
      end

      module Period

        class << self
          def periods(element, count)
            [].tap do |ary|
              (0..(count-1)).map{|n| ary << element.css('th')[n].text}
            end
          end
        end
      end
    end
  end
end
