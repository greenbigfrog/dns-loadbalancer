require "dotenv"
require "cryflare"

Dotenv.load

module Dns::Loadbalancer
  VERSION = "0.1.0"
end

class LB
  def initialize(@token : String, @zone : String)
    @client = Cryflare::Client.new(
      token: @token
    )
  end

  def update_record(original : String, new_record : String)
    update_record_id(get_dns_id(original), new_record)
    puts "#{original} now pointing to #{new_record}"
    return true
  end

  private def update_record_id(id : String, new_record : String)
    @client.dns_records.update(
      @zone,
      id,
      type: "A",
      content: new_record
    ) do |response|
      if response.success?
        return true
      else
        response.errors.each do |error|
          puts error.code
          puts error.message
        end
      end
    end
  end

  def get_dns_id(key : String)
    get_dns_record(key).not_nil!.id
  end

  def get_dns_record(key : String)
    @client.dns_records.index(@zone, name: key) do |response|
      if response.success?
        r = response.result
        if !(r.try &.size == 1)
          raise "Multiple records found"
        else
          return r.not_nil!.first
        end
      else
        response.errors.each do |error|
          puts error
        end
      end
    end
  end
end

lb = LB.new(
  token: ENV["CLOUDFLARE_TOKEN"],
  zone: ENV["ZONE"])

puts lb.update_record("test.gbf.re", "8.8.8.8")
