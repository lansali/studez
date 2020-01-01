class SkillsGrid < BaseGrid

  scope do
    Skill.all
  end

  filter(:id, :integer)
  filter(:created_at, :date, :range => true)

  column(:id)
  column(:name)
  date_column(:created_at)
end
