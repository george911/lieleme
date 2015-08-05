require 'spec_helper'
describe User do
  let(:job) { Job.create title: '采购经理' }
  let!(:comment) { job.comments.create body: '薪资丰厚' }

  describe "#comments"
    before do
      job.comments.create(body: '上班太远')
    end

    specify{ expect(job.comments.count).to eq(2) }
end

