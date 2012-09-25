if Rails.env.development? || Rails.env.test?
  require "silent-oracle/railtie"

  module SilentOracle
    SILENCED_METHODS = %w(next_sequence_value tables has_primary_key_trigger? columns pk_and_sequence_for temporary_table?)
    def self.included(base)
      SILENCED_METHODS.each do |m|
        base.send :alias_method_chain, m, :silencer
      end
    end

    SILENCED_METHODS.each do |m|
      m1, m2 = if m =~ /^(.*)\?$/
                 [$1, '?']
               else
                 [m, nil]
      end

      eval <<-METHOD
        def #{m1}_with_silencer#{m2}(*args)
          @logger.silence do
            #{m1}_without_silencer#{m2}(*args)
          end
        end
      METHOD
    end
  end

end
