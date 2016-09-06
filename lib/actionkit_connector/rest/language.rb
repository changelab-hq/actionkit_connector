module ActionKitConnector
  module REST
    module Language
      def list_languages
        self.class.get('/language', prep_options({}))
      end
    end
  end
end
