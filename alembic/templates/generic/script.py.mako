"""${message}

Revision ID: ${up_revision}
Revises: ${down_revision | comma,n}
Create Date: ${create_date}

"""

# revision identifiers, used by Alembic.
revision = ${repr(up_revision)}
down_revision = ${repr(down_revision)}
branch_labels = ${repr(branch_labels)}
depends_on = ${repr(depends_on)}

from alembic import op
import sqlalchemy as sa
from sqlalchemy.sql import text
${imports if imports else ""}

def upgrade():
    upgrade_script = '${config.file_config._sections['alembic']['script_location']}/versions/sql/${up_revision}_${message.replace(' ', '_')}_upgrade.sql'
    sql = open(upgrade_script, 'r').read()
    op.get_bind().execute(text(sql))

def downgrade():
    downgrade_script = '${config.file_config._sections['alembic']['script_location']}/versions/sql/${up_revision}_${message.replace(' ', '_')}_downgrade.sql'
    sql = open(downgrade_script, 'r').read()
    op.get_bind().execute(text(sql))