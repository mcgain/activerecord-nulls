require "activerecord/nulls/version"

module Activerecord
  module Nulls
    module ClassMethods
      def null(klass)
        @null_class = klass
      end

      def find(ids)
        super
      rescue ActiveRecord::RecordNotFound
        @null_class.new
      end
    end
  end
end
