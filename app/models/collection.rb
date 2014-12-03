class Collection < ActiveRecord::Base
  has_many :subjects

  def stats
    {active: active_subject_count, complete: complete_subject_count, complete_with_consensus: complete_with_consensus_subject_count }
  end

  def active_subject_count
    subjects.active.count
  end

  def complete_subject_count
    subjects.complete.count
  end

  def complete_with_consensus_subject_count
    subjects.complete_with_consensus.count
  end

end
