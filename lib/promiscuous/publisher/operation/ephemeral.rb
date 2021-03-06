class Promiscuous::Publisher::Operation::Ephemeral < Promiscuous::Publisher::Operation::Base
  def initialize(options={})
    super
    @instance = options[:instance]

    @routing  = options[:routing]
    @exchange = options[:exchange]
    @topic    = options[:topic]
  end

  def execute_instrumented(query)
    queue_operation_payloads
    publish_payloads(:exchange => @exchange, :routing => @routing, :topic => @topic)
  end

  def increment_version_in_document
    # No op
  end
end
