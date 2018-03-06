defmodule DB do
	def query(sql) when sql != "" do
		{:ok, result} = Ecto.Adapters.SQL.query(DbConnect.Repo, sql, [])
		result
	end

	def columns(%{columns: cols} = _result), do: cols;
	def rows(%{rows: rows} = _result), do: rows;
	def columns_rows(result) do
		result.columns
			|> Enum.zip(hd(result.rows))
			|> Enum.into(%{})
	end
	def viewable(value) when is_tuple(value), do: Timex.to_datetime(value)
	def viewable(value), do: value
end