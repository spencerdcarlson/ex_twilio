defmodule ExTwilio.TrustHub.EndUser do
  @moduledoc """
  Represents a EndUser

  - [EndUser docs](https://www.twilio.com/docs/trust-hub/trusthub-rest-api/enduser-resource)

  ## Examples

  An `ExTwilio.TrustHub.EndUser` represents a Customer Profile. To see all policies run:

      ExTwilio.TrustHub.EndUser.all()

  If you want to find a specific Policy, use `find/1`.

      ExTwilio.TrustHub.EndUser.find("sid")
  If you want to create a new Secondary Customer Profile, use `create/1`.

      attributes = Jason.encode!(%{
          business_identity: "direct_customer",
          business_industry: "EDUCATION",
          business_name: "acme business",
          business_regions_of_operation: "USA_AND_CANADA",
          business_registration_identifier: "EIN",
          business_registration_number: "US EIN: [55-5555555]",
          business_type: "Limited Liability Corporation",
          social_media_profile_urls: "",
          website_url: "test.com"
      })

      ExTwilio.TrustHub.EndUser.create(%{attributes: attributes, friendly_name: "acme business customer profile", type: "customer_profile_business_information"})

      attributes = Jason.encode!(%{
          business_title: "ceo",
          email: "rep1@acme.com",
          first_name: "rep1",
          job_position: "CEO",
          last_name: "acme",
          phone_number: "+11234567890"
      })
      ExTwilio.TrustHub.EndUser.create(%{attributes: attributes, friendly_name: "ceo_auth_rep_1", type: "authorized_representative_1"})
  """

  defstruct sid: nil,
            account_sid: nil,
            friendly_name: nil,
            type: nil,
            attributes: nil,
            date_created: nil,
            date_updated: nil,
            url: nil

  use ExTwilio.Resource, import: [:all, :stream, :find, :create, :update, :destroy]
end
