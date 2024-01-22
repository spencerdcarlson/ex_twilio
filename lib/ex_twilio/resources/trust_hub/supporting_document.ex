defmodule ExTwilio.TrustHub.SupportingDocument do
  @moduledoc """
  Represents a Policy

  - [Supporting Document docs](https://www.twilio.com/docs/trust-hub/trusthub-rest-api/supportingdocument-resource)

  ## Examples

  An `ExTwilio.TrustHub.SupportingDocument` represents a Policy. To see all policies run:

      ExTwilio.TrustHub.SupportingDocument.all()

  If you want to find a specific Policy, use `find/1`.

      ExTwilio.TrustHub.SupportingDocument.find("sid")
  If you want to create a new Secondary Customer Profile, use `create/1`.

      attributes = Jason.encode!(%{
          address_sids: "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      })

      ExTwilio.TrustHub.SupportingDocument.create(%{attributes: attributes, friendly_name: "acme business address", type: "customer_profile_address"})
  """

  defstruct sid: nil,
            account_sid: nil,
            friendly_name: nil,
            mime_type: nil,
            status: nil,
            type: nil,
            attributes: nil,
            date_created: nil,
            date_updated: nil,
            url: nil

  use ExTwilio.Resource, import: [:all, :stream, :find, :create, :update, :destroy]
end
