class DradisTasks < Thor
  class Import < Thor
    class OSVDB < Thor
      namespace     "dradis:import:osvdb"

      desc      "by_custom_query QUERY", "search the OSVDB with a general query"
      def by_custom_query(query)
        require 'config/environment'

        results = Dradis::Plugins::OSVDB::Filters::GeneralSearch.run(:query => query)

        puts "OSVDB Search\n============"
        puts "#{results.size} results"

        results.each do |record|
          puts "#{record[:title]}\n\t#{record[:description]}"
        end
      end

      desc      "lookup by OSVDB ID", "search the OSVDB for a specific ID"
      def by_osvdbid(id)
        require 'config/environment'

        results = Dradis::Plugins::OSVDB::Filters::OSVDBIDLookup.run(:query => id)

        puts "OSVDB Search\n============"
        puts "#{results.size} results"

        results.each do |record|
          puts "#{record[:title]}\n\t#{record[:description]}"
        end
      end

    end
  end
end
