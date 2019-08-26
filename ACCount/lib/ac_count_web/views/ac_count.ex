defmodule AcCountWeb.ACCountView do
  use AcCountWeb, :view

  def render("ac_count.json", %{api_data: _params}) do
    %{
        match_id: "266",
        ac_list: [
            %{
                id: "001",
                count: 13
            },
            %{
                id: "002",
                count: 8
            },
            %{
                id: "003",
                count: 42
            },
            %{
                id: "004",
                count: 13
            },
            %{
                id: "005",
                count: 25
            },
            %{
                id: "006",
                count: 23
            },
            %{
                id: "007",
                count: 10
            },
            %{
                id: "008",
                count: 14
            },
            %{
                id: "009",
                count: 12
            },
        ]
    }
  end
end
