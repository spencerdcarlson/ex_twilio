defmodule ExTwilio.TrustHub.Evaluation do
  @moduledoc """
  Represents a Evaluation

  - [EndUser docs](https://www.twilio.com/docs/trust-hub/trusthub-rest-api/trust-products/evaluations-tp)

  ## Examples

  An `ExTwilio.TrustHub.Evaluation` represents a Customer Profile. To see all policies run:

      ExTwilio.TrustHub.Evaluation.all_evaluations("Trust Product Sid")

  If you want to find a specific Evaluation, use `find/1`.

      ExTwilio.TrustHub.Evaluation.find_evaluation("Trust Product Sid", "sid")

  If you want to create a specific Evaluation, use `create_evaluation/1`.

      ExTwilio.TrustHub.Evaluation.create_evaluation("Trust Product Sid", [policy_sid: "policy sid"])
  """

  defstruct sid: nil,
            account_sid: nil,
            policy_sid: nil,
            trust_product_sid: nil,
            status: nil,
            results: nil,
            date_created: nil,
            url: nil

  use ExTwilio.Resource, import: [:all, :stream, :find, :create]

  def parents, do: [:trust_product]
  def children, do: [:evaluation]

  def create_evaluation(sid, params \\ []), do: create(params, [trust_product: sid])

  def find_evaluation(sid, evaluation_sid), do: all([trust_product: sid, evaluation: evaluation_sid])

  def all_evaluations(sid), do: all([trust_product: sid])
end
