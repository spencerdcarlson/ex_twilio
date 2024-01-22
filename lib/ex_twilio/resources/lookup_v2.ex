defmodule ExTwilio.LookupV2 do
  @moduledoc """
  Represents the Lookup Api provided by Twilio

  - [Twilio docs](https://www.twilio.com/docs/lookup/v2-api#response-properties)
  """
  alias ExTwilio.{Parser, Config}
  alias ExTwilio.UrlGenerator, as: Url

  @base_url "https://lookups.twilio.com/v2/PhoneNumbers/"

  defmodule PhoneNumber do
    @moduledoc false
    defstruct calling_country_code: nil,
              country_code: nil,
              phone_number: nil,
              national_format: nil,
              valid: nil,
              validation_errors: nil,
              caller_name: nil,
              sim_swap: nil,
              call_forwarding: nil,
              live_activity: nil,
              line_type_intelligence: nil,
              identity_match: nil,
              reassigned_number: nil,
              sms_pumping_risk: nil,
              phone_number_quality_score: nil,
              url: nil
  end

  @doc """
  Retrieves information based on the phone number. Supports Twilio's add-ons.

  ## Examples

      {:ok, info} = ExTwilio.LookupV2.retrieve("12345678910", [Type: carrier])

  """
  def retrieve(phone_number, query \\ []) do
    auth = [basic_auth: {Config.account_sid(), Config.auth_token()}]
    query_string = "?" <> Url.to_query_string(query)

    "#{@base_url}#{phone_number}#{query_string}"
    |> HTTPoison.get!([], hackney: auth)
    |> Parser.parse(PhoneNumber)
  end
end
