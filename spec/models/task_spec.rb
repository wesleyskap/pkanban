require "spec_helper"

describe Task do
  it "orders by higher priority" do
    task_prior_3 = Task.create(priority: 3.0)
    task_prior_5 = Task.create(priority: 5.0)
    task_prior_1 = Task.create(priority: 1.0)

    expect(Task.all).to eq([task_prior_5, task_prior_3, task_prior_1])
  end
end