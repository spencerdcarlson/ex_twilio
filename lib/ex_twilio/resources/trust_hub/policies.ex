defmodule ExTwilio.TrustHub.Policy do
  @moduledoc """
  Represents a Policy

  - [Policies docs](https://www.twilio.com/docs/trust-hub/trusthub-rest-api/policies)

  ## Examples

  An `ExTwilio.Policy` represents a Policy. To see all policies run:

      ExTwilio.Policy.all()

  If you want to find a specific Policy, use `find/1`.

      ExTwilio.Policy.find("sid")
  """

  defstruct sid: nil,
            friendly_name: nil,
            requirements: nil,
            url: nil

  use ExTwilio.Resource, import: [:stream, :all, :find]
end
