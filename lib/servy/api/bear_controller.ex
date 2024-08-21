defmodule Servy.Api.BearController do
  alias Servy.Wildthings

  def index(conv) do
    json =
      Wildthings.list_bears()
      |> Poison.encode!()

    conv = put_resp_content_type(conv, "application/json")
    %{conv | status: 200, resp_body: json}
  end

  defp put_resp_content_type(conv, content_type) do
    headers = Map.put(conv.resp_headers, "Content-Type", content_type)
    %{conv | resp_headers: headers}
  end
end
