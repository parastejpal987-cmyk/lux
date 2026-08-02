Mix.install([
  {:benchee, "~> 1.0"}
])

# Assuming Lux is compiled or available in path when this is run
# This benchmark requires the Lux application to be started.

Lux.Integrations.Telegram.Queue.start_link([])

Benchee.run(
  %{
    "queue_serialization" => fn ->
      Lux.Integrations.Telegram.Queue.enqueue(fn ->
        {:ok, %{"ok" => true}}
      end)
    end
  },
  time: 3,
  memory_time: 1
)
