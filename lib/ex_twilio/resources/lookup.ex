defmodule ExTwilio.Lookup do
  @moduledoc """
  Represents the Lookup Api provided by Twilio

  - [Twilio docs](https://www.twilio.com/docs/lookup/api)
  """
  alias ExTwilio.{Parser, Config}
  alias ExTwilio.UrlGenerator, as: Url

  @base_url "https://lookups.twilio.com/v1/PhoneNumbers/"

  defmodule PhoneNumber do
    @moduledoc false
    defstruct url: nil,
              carrier: nil,
              caller_name: nil,
              national_format: nil,
              phone_number: nil,
              country_code: nil,
              add_ons: nil
  end

  #  "url": "https://lookups.twilio.com/v2/PhoneNumbers/+13852896994",

  #  {
  #  "call_forwarding": null,
  #  "caller_name": null,
  #  "calling_country_code": "1",
  #  "country_code": "US",
  #  "identity_match": null,
  #  "line_type_intelligence": null,
  #  "live_activity": null,
  #  "national_format": "(385) 289-6994",
  #  "phone_number": "+13852896994",
  #  "phone_number_quality_score": null,
  #  "reassigned_number": null,
  #  "sim_swap": null,
  #  "sms_pumping_risk": null,

  #  "valid": true,
  #  "validation_errors": []
  # }

  @doc """
  Retrieves information based on the inputed phone number. Supports Twilio's add-ons.

  ## Examples

      {:ok, info} = ExTwilio.Lookup.retrieve("12345678910", [Type: carrier])

  """
  def retrieve(phone_number, query \\ []) do
    auth = [basic_auth: {Config.account_sid(), Config.auth_token()}]
    query_string = "?" <> Url.to_query_string(query)

    "#{@base_url}#{phone_number}#{query_string}"
    |> HTTPoison.get!([], hackney: auth)
    |> Parser.parse(PhoneNumber)
  end
end
