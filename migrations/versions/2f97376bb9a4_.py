"""empty message

Revision ID: 2f97376bb9a4
Revises: a1275b2e6d44
Create Date: 2022-03-14 22:04:23.618784

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '2f97376bb9a4'
down_revision = 'a1275b2e6d44'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('contract',
    sa.Column('id', sa.Integer(), nullable=False),
    sa.Column('StartDate', sa.Date(), nullable=False),
    sa.Column('EndDate', sa.Date(), nullable=False),
    sa.Column('type', sa.Date(), nullable=False),
    sa.Column('id_squad', sa.Integer(), nullable=True),
    sa.Column('id_player', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['id_player'], ['player.id'], ),
    sa.ForeignKeyConstraint(['id_squad'], ['squad.id'], ),
    sa.PrimaryKeyConstraint('id')
    )
    op.create_unique_constraint(None, 'player', ['name'])
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'player', type_='unique')
    op.drop_table('contract')
    # ### end Alembic commands ###
