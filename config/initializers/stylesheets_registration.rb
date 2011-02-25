require 'action_view'

ActionView::Helpers::AssetTagHelper.register_stylesheet_expansion :desktop => [
  'reset', 'jquery-ui-1.8.5.custom', 'screen', 'nivo-slider/nivo-slider']