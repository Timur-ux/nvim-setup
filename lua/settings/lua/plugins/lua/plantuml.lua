require("plantuml").setup({
	auto_start = false,
  use_docker = true,                    -- Enable Docker PlantUML server
  docker_image = "plantuml/plantuml-server:jetty",  -- Docker image
  docker_port = 8080,                   -- Host port for container
  docker_remove_on_stop = false,        -- Keep container after stopping
})
