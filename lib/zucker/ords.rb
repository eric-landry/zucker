require 'zucker'

module Zucker
  module Ords
    refine Array do
      def chrs
        self.pack 'C*'
      end
    end

    refine String do
      def ords
        self.unpack 'C*'
      end
    end
  end
end
