require "ee_cummings/version"
require "ee_cummings/configuration"
require "ee_cummings/values"
require "ee_cummings/variable_registry"
require "ee_cummings/variable_definition"
require "ee_cummings/variable_warehouse"
require "ee_cummings/variable_source"
require "ee_cummings/variable_validator"
require "ee_cummings/misconfigured_variable"

module EECummings
  extend Configuration
  extend Values
end
