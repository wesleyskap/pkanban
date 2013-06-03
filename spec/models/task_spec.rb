require "spec_helper"

describe Task do
  it "orders by higher priority" do
    task_prior_3 = Task.create(name: 'Task 1', priority: 3.0)
    task_prior_5 = Task.create(name: 'Task 2', priority: 5.0)
    task_prior_1 = Task.create(name: 'Task 3', priority: 1.0)

    expect(Task.all).to eq([task_prior_5, task_prior_3, task_prior_1])
  end
end
