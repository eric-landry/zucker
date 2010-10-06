require 'zucker'

class Binding
  def variables
    put_vars = lambda { |array|
      if array.empty?
        ' - none'
      else
        array.map{|e|
          val = self.eval "#{e}"
          val = val.is_a?( Binding ) ? val.to_s : val.inspect
          " - #{e}: #{ val }"
        }.join "\n"
      end
    }

"#{self.to_s}
local vars
#{ put_vars[ self.eval 'local_variables' ] }
(instance vars)
#{ put_vars[ self.eval 'instance_variables' ] }
self
 - #{self.eval 'self'}
block_given?
 - #{self.eval 'block_given?'}"

  end

  alias vars variables
end

# J-_-L
