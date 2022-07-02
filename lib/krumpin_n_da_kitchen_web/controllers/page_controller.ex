defmodule KrumpinNDaKitchenWeb.PageController do
  use KrumpinNDaKitchenWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
