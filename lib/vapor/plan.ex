defmodule Vapor.Plan do
  @moduledoc """
  Creates a configuration plan that will be loaded by the configuration module.
  """

  defstruct plans: [], watches: []

  @doc """
  Creates an initial configuration.
  """
  def default do
    %__MODULE__{}
  end

  @doc """
  Merges an existing configuration plan with a new configuration plan.
  Plans are stacked and applied in the order that they are merged.
  """
  def merge(existing_plan, plan) do
    %{existing_plan | plans: [plan | existing_plan.plans]}
  end

  @doc """
  Tells the plan to watch a specific source for changes.
  """
  def watch(existing_plan, plan) do
    %{existing_plan | watches: [plan | existing_plan.watches]}
  end
end
