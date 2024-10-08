# frozen_string_literal: true

require "rails_helper"
require "decidim/proposals/test/factories"

describe Decidim::Stats::Actions::ProposalVote do
  subject do
    described_class.new(component, performers_query)
  end

  let(:performers_query) { Decidim::User.all }
  let!(:vote) { create(:proposal_vote) }
  let(:user) { vote.author }
  let(:component) { vote.proposal.component }

  context "when looking for proposal vote authors matching the component" do
    it "finds the user ID" do
      expect(subject.query).to contain_exactly(user.id)
    end
  end

  context "when looking for proposal vote authors but the performers do not match" do
    let(:performers_query) { Decidim::User.none }

    it "cannot find the user" do
      expect(subject.query).to be_empty
    end
  end

  context "when looking for proposal vote authors but the components do not match" do
    let(:component) { create(:component) }

    it "cannot find the user" do
      expect(subject.query).to be_empty
    end
  end
end
