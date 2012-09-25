module SilentOracle
  def self.init!
    ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter.send(:include, SilentOracle)
  rescue NameError
  end

  if defined?(Rails::Railtie)
    # Rails 3
    class Railtie < Rails::Railtie
      initializer 'silent_oracle.insert_into_active_record' do
        ActiveSupport.on_load :active_record do
          SilentOracle.init!
        end
      end
    end
  else
    # Rails 2
    init!
  end
end
