defmodule SampleWeb.PrefectureView do
  use SampleWeb, :view
  alias SampleWeb.PrefectureView

  def render("index.json", %{prefectures: prefectures}) do
    %{data: render_many(prefectures, PrefectureView, "prefecture.json")}
  end

  def render("show.json", %{prefecture: prefecture}) do
    %{data: render_one(prefecture, PrefectureView, "prefecture.json")}
  end

  def render("prefecture.json", %{prefecture: prefecture}) do
    %{id: prefecture.id,
      prefecture_name: prefecture.prefecture_name}
  end
end
