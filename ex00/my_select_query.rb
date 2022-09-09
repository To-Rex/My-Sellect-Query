require 'csv'

class MySelectQuery 
    def initialize(content)
        @data = CSV.parse(content, headers: true)
    end

    def where(columns, values)
        results = []
        @data.filter do |row|
            if row[columns] == values
                results << row.to_hash.values.join(",")
            end
        end
        results
    end
end

# def main
#    content = "name,year_start,year_end,position,height,weight,birth_date,college\nAlaa Abdelnaby,1991,1995,F-C,6-10,240,'June 24, 1968',Duke University\nZaid Abdul-Aziz,1969,1978,C-F,6-9,235,'April 7, 1946',Iowa State University\nKareem Abdul-Jabbar,1970,1989,C,7-2,225,'April 16, 1947','University of California, Los Angeles
#    Mahmoud Abdul-Rauf,1991,2001,G,6-1,162,'March 9, 1969',Louisiana State University\n"
#     query = MySelectQuery.new(content)
#     puts query.where("name", "Kareem Abdul-Jabbar")
# end

# main()