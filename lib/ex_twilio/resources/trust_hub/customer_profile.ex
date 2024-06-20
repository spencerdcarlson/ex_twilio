defmodule ExTwilio.TrustHub.CustomerProfile do
  @moduledoc """
  Represents a Customer Profile

  - [Customer Profile docs](https://www.twilio.com/docs/trust-hub/trusthub-rest-api/customer-profiles)

  ## Examples

  An `ExTwilio.TrustHub.CustomerProfile` represents a Customer Profile. To see all policies run:

      ExTwilio.TrustHub.CustomerProfile.all()

  If you want to find a specific Policy, use `find/1`.

      ExTwilio.TrustHub.CustomerProfile.find("sid")

  If you want to create a new Secondary Customer Profile, use `create/1`.

      ExTwilio.TrustHub.CustomerProfile.create([status_callback: "callback", friendly_name: "friendly_name", email: "email", policy_sid: "policy_sid"])

  If you want to evaluate a Customer Profile, use `evaluate/2`.

      ExTwilio.TrustHub.CustomerProfile.evaluate("sid", [policy_sid: "policy_sid"])

  If you want to submit a Customer Profile, use `submit/1`.

      ExTwilio.TrustHub.CustomerProfile.evaluate("sid")
  """

  defstruct sid: nil,
            account_sid: nil,
            policy_sid: nil,
            friendly_name: nil,
            status: nil,
            valid_until: nil,
            email: nil,
            status_callback: nil,
            date_created: nil,
            date_updated: nil,
            url: nil,
            links: nil

  use ExTwilio.Resource, import: [:all, :stream, :find, :create, :update, :destroy]

  def children, do: [:evaluation]

  def evaluate(sid, policy_sid: policy_sid), do: evaluate(sid, %{policy_sid: policy_sid})

  def evaluate(sid, %{policy_sid: policy_sid}) do
    update(sid, [policy_sid: policy_sid], evaluation: "Evaluations")
  end

  def submit(sid), do: update(sid, status: "pending-review")
end
