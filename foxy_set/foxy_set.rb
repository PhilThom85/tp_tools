def foxy_set(value=nil, options = nil)
  if options.is_a? Hash
    default = options[:default]
    local_array = options.delete(:array)
  else
    default=options
  end
  if value.nil?
    default
  else
    if local_array
      new_arg = []
      value.each { |key| new_arg << local_array[key] }
      foxy_set(new_arg, options)
    else
      if value.is_a? Array
        array_result = []
        value.each { |val| array_result << foxy_set( val, options ) }
        array_result
      else
        value
      end
    end
  end
end
