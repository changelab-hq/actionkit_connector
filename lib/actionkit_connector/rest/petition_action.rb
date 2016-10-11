module ActionKitConnector
  module REST
    module PetitionAction
      def update_petition_action(id, data)
        self.class.put("/petitionaction/#{id}/", prep_options(data))
      end
    end
  end
end
