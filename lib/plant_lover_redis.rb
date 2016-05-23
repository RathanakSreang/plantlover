class PlantLoverRedis
  NAMESPACE = 'plants_lover:'

  class << self
    def set(key, value)
      $redis.set("#{NAMESPACE}#{key}", value)
      expire(key)
    end

    def get(key)
      $redis.get("#{NAMESPACE}#{key}")
    end

    def delete(key)
      return false unless exist?(key)
      $redis.del("#{NAMESPACE}#{key}")
      true
    end

    def exist?(key)
      $redis.exists("plants_lover:#{key}")
    end

    private
      def expire(key)
        $redis.expire("#{NAMESPACE}#{key}", 1.hour)
      end
  end
end