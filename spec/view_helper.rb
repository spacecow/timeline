require 'rspec/its'

class ErbBinding
  def initialize(hash)
    hash.each do |key, value|
      singleton_class.send(:define_method,key){ value }
    end
  end
  def get_bindings; binding end
end

module MyLetDeclarations
  module MyHelper
    def link_to lbl, path
      "<a href=\"#{path}\">#{lbl}</a>"
    end

    def method_missing(m, *args, &block)  
      if /(?<action>\w+)_(?<model>\w+)_path/ =~ m
        "/#{model}s/#{action}?#{args.first.map{|k,v| "#{k}=#{v}"}.join('&')}"
      end
    end  
  end

  extend RSpec::Core::SharedContext
  let(:rendered){ @erb.result @local_bindings }

  def render(file:nil, locals:{}, helper:nil)
    erb_binding = ErbBinding.
      new(locals).
      extend(MyHelper)
    erb_binding = erb_binding.extend(helper) unless helper.nil?
    @local_bindings = erb_binding.instance_eval{binding}
    @erb = ERB.new File.read(file)
  end

end
RSpec.configure { |c| c.include MyLetDeclarations }
