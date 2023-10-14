defmodule ExTwilio.TrustProduct do
  @moduledoc false
  # This is an empty resource so it can be used as
  # a parent in `ExTwilio.TrustHub.Evaluation`.

  defstruct sid: nil

  use ExTwilio.Resource, import: [:stream, :all]
end