defmodule HelloWeb.Ui do
  use Phoenix.LiveView
  import Swoosh.Email

  def render(assigns) do
  ~H"""
    <div>
      <p>Count: <%= @count %></p>
      <button phx-click="send_email">Increment</button>
    </div>
  """
  end

  def mount(_params, _session, socket) do
  {:ok, assign(socket, count: 0)}
  end

  def handle_event("send_email", _params, socket) do
    email = %Swoosh.Email{
    to: "testsandbox@seznam.cz",
    from: "jorikchase@gmail.com",
    subject: "My Subject",
    html_body: "<p>Hello, this is the body of the email.</p>",
    text_body: "Hello, this is the body of the email.",
    }
    Hello.Mailer.deliver(email)

    {:noreply, socket}
    end
  end
