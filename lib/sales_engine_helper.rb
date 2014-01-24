module SalesEngineHelper

  def clear
    @entities = []
  end

  def entities
    @entities ||= []
  end

  def add(entity)
    entities  << entity
  end

   def find_all_by(attribute, value)
    entities.select { |entity| entity.send(attribute) == value }
  end

  def find_one(attribute, value)
    find_all_by(attribute, value).first
  end


  def find_by_id(id)
    find_one('id', id)
  end

   def find_by_created_at(created_at)
    find_one('created_at', created_at)
  end

  def find_by_updated_at(updated_at)
    find_one('updated_at', updated_at)
  end


  def find_by_name(name)
    find_one('name', name)
  end


  def find_all_by_name(name)
    find_all_by('name',name)
  end




end 