module ActionKitConnector
  module REST
    module QueryReport
      def list_query_reports(name_contains: nil)
        if name_contains
          query = {'name__contains' => name_contains}
        else
          query = {}
        end

        self.class.get('/queryreport/', prep_options({}, {query: query}))
      end

      def list_query_reports_in_category(category_id)
        response = self.class.get("/reportcategory/#{category_id}/", prep_options({}))
        report_ids = response['reports'].map{ |r| r.split("/").last }
        return report_ids.map{|report_id|
          report = self.get_query_report(report_id)
          report.slice("id", "name")
        }
      end

      def get_query_report(id)
        self.class.get("/queryreport/#{id}/", prep_options({}))
      end

      def run_query_report_async(id)
        puts prep_options({})
        self.class.post("/report/background/#{id}/?format=csv", prep_options({}))
      end

      def download_query_report(background_task_id)
        self.class.get("/report/download/#{background_task_id}/", prep_options({}))
      end
    end
  end
end
