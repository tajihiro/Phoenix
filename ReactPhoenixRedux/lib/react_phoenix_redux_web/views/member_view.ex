defmodule ReactPhoenixReduxWeb.MemberView do
  use ReactPhoenixReduxWeb, :view
  alias ReactPhoenixReduxWeb.MemberView

  def render("index.json", %{members: members}) do
    %{data: render_many(members, MemberView, "member.json")}
  end

  def render("show.json", %{member: member}) do
    %{data: render_one(member, MemberView, "member.json")}
  end

  def render("member.json", %{member: member}) do
    %{id: member.id,
      last_name: member.last_name,
      first_name: member.first_name,
      email: member.email,
      passwd: member.passwd}
  end
end
