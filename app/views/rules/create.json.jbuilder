if @rule.persisted?
  json.form render(partial: "rules_form", formats: :html, locals: {household: @household, rule: Rule.new})
  json.inserted_item render(partial: "show", formats: :html, locals: {rule: @rule})
else
  json.form render(partial: "rules_form", formats: :html, locals: {household: @household, rule: @rule})
end
