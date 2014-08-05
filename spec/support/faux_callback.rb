class FauxCallback
  def configure
    lambda do |on|
      on.success { |*args| [:success, *args] }
      on.failure { |*args| [:failure, *args] }
    end
  end
end
