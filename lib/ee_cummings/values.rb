module EECummings
  module Values
    def warehouse=(warehouse)
      $warehouse=warehouse
    end

    def method_missing(meth, *args, &block)
      key = meth.upcase.to_s
      $warehouse.get_value(key) || super
    end
  end
end
