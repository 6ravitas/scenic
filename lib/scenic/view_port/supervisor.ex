#
#  Created by Boyd Multerer on 10/07/17.
#  Copyright © 2017 Kry10 Industries. All rights reserved.
#

defmodule Scenic.ViewPort.Supervisor do
  use Supervisor
  alias Scenic.ViewPort

  @dynamic_supervisor   :vp_dynamic_sup
  @dynamic_scenes       :dynamic_scenes
  @dynamic_drivers      :dynamic_drivers

  #============================================================================
  # setup the viewport supervisor

  def start_link( initial_scene, args, opts \\ [] ) do
    Supervisor.start_link(__MODULE__, {initial_scene, args, opts})
  end

  def init( {initial_scene, args, opts} ) do
    [
#      Supervisor.child_spec({Registry, keys: :unique, name: :viewport_registry},  id: :viewport_registry),
#      Supervisor.child_spec({Registry, keys: :duplicate, name: :driver_registry}, id: :driver_registry),
      {DynamicSupervisor, name: @dynamic_supervisor, strategy: :one_for_one},
      {Scenic.ViewPort, {initial_scene, args, opts}},
#      {DynamicSupervisor, name: @dynamic_drivers, strategy: :one_for_one},
#      Supervisor.child_spec({Registry, keys: :duplicate, name: :input_registry},  id: :input_registry),
#      supervisor(ViewPort.Driver.Supervisor, []),
#      supervisor(ViewPort.Input.Tracker.Supervisor, [])
    ]
    |> Supervisor.init( strategy: :rest_for_one )
  end

end
