data:extend{
  {
    type = "bool-setting",
    name = "beltlayer-show-buffer-contents",
    setting_type = "startup",
    default_value = false,
  },

  {
		type = "string-setting",
		name = "beltlayer-blueprint",
		setting_type = "runtime-per-user",
		default_value = "alt-not-pressed",
		allowed_values = {"alt-pressed", "alt-not-pressed"}
  },
  {
		type = "string-setting",
		name = "beltlayer-deconstruct",
		setting_type = "runtime-per-user",
		default_value = "alt-not-pressed",
		allowed_values = {"alt-pressed", "alt-not-pressed"}
  },

  {
    type = "int-setting",
    name = "beltlayer-buffer-stacks",
    setting_type = "startup",
    default_value = 2,
    minimum_value = 1,
    maximum_value = 100,
  },

  {
    type = "int-setting",
    name = "beltlayer-update-interval",
    setting_type = "runtime-global",
    minimum_value = 30,
    default_value = 300,
  },

  {
    type = "bool-setting",
    name = "beltlayer-deconstruction-warning",
    setting_type = "runtime-per-user",
    default_value = true,
  },
}