import random
import farsante
from mimesis import Person
from mimesis import Address
from mimesis import Datetime
from mimesis.builtins import USASpecProvider

person      = Person()
address     = Address()
datetime    = Datetime()
us          = USASpecProvider()

df = farsante.pandas_df(
    funs = [
        person.full_name,
        address.address,
        person.name,
        person.email,
        address.city,
        address.state,
        datetime.datetime,
        us.ssn
    ],
    num_rows=5000
)

df.to_csv('super_fake_pii.csv', index=False)
